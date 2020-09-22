var fileHeader = ""; /* everything in the file, up to the special translations */
var fileMiddle = ""; /* everything between the special translations up to the first normal translation */
var fileName   = ""; /* the original file name */
var currentType = "";

function init() {
  const fileSelector = document.getElementById('file-selector');
  fileSelector.addEventListener('change', (event) => { onChooseFile(event.target.files[0]) } );
  document.getElementById('generateSamples').addEventListener('click', (event) => { onGenerateMessages() } );

  /* allow for auto resizing of the textarea */
  document.getElementById('normal-translation').addEventListener('change', resizeTextArea );
  document.getElementById('normal-translation').addEventListener('keydown', resizeTextArea );

}

function onChooseFile(file) {
    fileName = file.name;
    const reader = new FileReader();
    reader.addEventListener('load', (event) => {
        onReadTranslations(event.target.result);
    });
    reader.readAsText(file);
}


/* Matches one liners. [1] = type, [2] = code */
const specialTranslations = /^'(.+?)'\s+=>\s+method\s+{(.*?)}\s*,\s*$/;
const typeLine = /^#\s*Class:\s*(\S+)\s*$/;
const statusLine = /^#\s*Status:\s*(.*?)$/;
const noteLine = /^(#\s*Notes:\s*)(.*?)$/;
const origLine = /^#\s*Original\s*Code:\s*$/;
const methodLine = /^'.+?'\s+=>\s+method\s+{\s*$/;


var translations = { special : {}, normal : {}   };

function onReadTranslations(text) {
    const lines = text.split("\n");
    console.log(lines[0]);

    let lineNº = 0;

    /* Scan to the start of special translations */
    while (lines[lineNº].indexOf('# BEGIN SPECIAL TRANSLATIONS ') == -1) {
        fileHeader += (fileHeader ? "\n" : "") + lines[lineNº] ;
        lineNº++;
    }

    /* Handle the begin line, and now we're on the first line */
    fileHeader += "\n" + lines[lineNº];
    lineNº++;

    /* Scan through the special translations */
    while (special = lines[lineNº].match(specialTranslations)) {
        translations['special'][special[1]] = special[2];
        lineNº++;
    }

    /* We should be at the end, but scan to the end to be sure */
    while (lines[lineNº].indexOf('# END SPECIAL TRANSLATIONS ') == -1) { lineNº++; }

    /* Increment by one and we can start teasing out regular translations */
    fileMiddle += "\n" + lines[lineNº]
    lineNº++;

    /* When blank, we need to find them */
    let type   = "";
    let status = "";
    let note   = "";
    let orig   = "";
    let trans  = "";
    let m;
    let foundFirst = false;

    while (lineNº < lines.length) {
        let line = lines[lineNº++];
        if ((type == "") && (m = line.match(typeLine))) {
            type = m[1];
            foundFirst = true;
        } else if ((status == "") && (m = line.match(statusLine))) {
            status = m[1];
        } else if ((note == "") && (m = line.match(noteLine))) {
            indent = m[1].length;
            note   = m[2];
            while (!lines[lineNº].match(origLine)) {
                note += "\n" + lines[lineNº++].substr(indent);
            }
        } else if ((orig == "") && (line.match(origLine))) {
            while (lines[lineNº].indexOf('#') == 0) {
                orig += (orig == "" ? "" : "\n") + lines[lineNº++].substr(1);
            }
        } else if ((trans == "") && (line.match(methodLine))) {
            while (lines[lineNº].indexOf('},') != 0) {
                trans += (trans == "" ? "" : "\n") + lines[lineNº++];
            }
            lineNº++;
            translations.normal[type] = { 'type' : type, 'status' : status, 'note' : note, 'orig' : orig, 'trans' : trans };
            type = status = note = orig = trans = "";
        } else {
            if (!foundFirst) {
                fileMiddle += "\n" + line;
            }
        }
    }

    onParsedFile();
}

function onParsedFile() {
    let list = document.getElementById("x-selector");
    list.addEventListener('change', (event) => { onChooseException(event) } );

    let header = document.createElement("OPTGROUP");
    header.label = "Special Translations";
    list.appendChild(header);


    for(let xkey of Object.keys(translations.special).sort()) {
        let option = document.createElement('OPTION');
        option.value = xkey;
        option.innerHTML = xkey;
        option.id = 'sel:' + xkey;
        header.appendChild(option);
    }

    header = document.createElement("OPTGROUP");
    header.label = "Normal Translations";
    list.appendChild(header);

    for(let xkey of Object.keys(translations.normal).sort()) {
        let option = document.createElement('OPTION');
        option.value = xkey;
        option.innerHTML = xkey;
        option.id = 'sel:' + xkey;
        header.appendChild(option);
    }

    document.getElementById('intro').style.display = "none";
    document.getElementById('controls').style.display = "block";
    document.getElementById('x-selector').style.visibility = "visible";
    document.getElementById('normal-table').style.visibility = "visible";
}

function onChooseException(event) {
    if (currentType) {
        console.log(currentType);
        console.log(currentType.indexOf("."));

        if (currentType.indexOf(".") >= 0) {
            /* special types have a period */

        }else{
            /* normal types don't have a period */
            translations["normal"][currentType]["trans"] = document.getElementById("normal-translation").value;
            translations["normal"][currentType]["status"] = document.getElementById("normal-status").value;
        }

    }


    if (event.target.selectedIndex <= event.target.childNodes[0].childNodes.length) {
        onChooseSpecialException(event);
    }else{
        onChooseNormalException(event);
    }
}

function onChooseSpecialException(event) {
    let idx = event.target.selectedIndex;
    let type = currentType = event.target[idx].value;
    let trans = translations['special'][type];
}

function onChooseNormalException(event) {
    let idx = event.target.selectedIndex;
    let type = currentType = event.target[idx].value;
    let x = translations['normal'][type];

    document.getElementById("normal-type").innerHTML = x.type;
    document.getElementById("normal-status").value = x.status;
    document.getElementById("normal-original").textContent = "    method message (" + x.type + ":D:) {\n" + x.orig + "\n    }";
    document.getElementById("normal-notes").textContent = x.note;
    document.getElementById("normal-translation").value = x.trans;
    document.getElementById("trans-type-name").innerHTML = x.type;
    resizeTextArea();
}

function onGenerateMessages(event) {
    if (Raku.state != "Ready") {
        Raku.init( function () {onGenerateMessages(event)} );
        return;
    }

    /* Clear the current output */
    document.getElementById('output').textContent = "";

    let preCode = 'use nqp; ';

    /* Generate the that we'll use definition */
    let inner = document.getElementById("normal-translation").value;
    let methodDef = "my &test-method = method {" + inner + "};\n";

    /* Grab the set of sample values, if there are any */
    let testAttrSets = test[currentType] || [{}];

    /* Run a test for each set of test values */
    for (testAttrs of testAttrSets) {

        /* The Tester class allows any attribute to be set */;
        let testClass = "Tester.new(\n";
        for (attr of Object.keys(testAttrs)) {
            if (testAttrs[attr]) {
                testClass += attr + " => " + testAttrs[attr] + ",\n";
            } else {
                /* Allows us to test for a blank item */
                testClass += attr + " => Nil,\n";
            }
        }
        testClass += document.getElementById('generateAttributes').value;

        testClass += ")";

        console.log("Calling the following:")
        console.log(methodDef + testClass + ".&test-method.say");
        /* Actually run the method.  $*OUT is captured in JS's fromRaku() */
        Raku.eval(preCode + methodDef + testClass + ".&test-method.say");
    }

}

Raku.output = function(text, chan) { fromRaku(text, chan) };
function fromRaku(text, chan) {
    document.getElementById('output').textContent += text + "\n";
}


/* Resizes the code entry area to match its content */
function resizeTextArea() {
    let text = document.getElementById("normal-translation");
    let cell = document.getElementById("normal-translation-cell");
    text.style.height = "auto";
    text.style.height = text.scrollHeight + "px";
    cell.style.height = text.scrollHeight + "px";
}


function onDragEnter(event) {
    let div = document.getElementById("file-dragdrop");
    if (event.dataTransfer.items.length == 1) {
        div.style.backgroundColor = "rgba(0,255,0,.2)";
    } else {
        div.style.backgroundColor = "rgba(255,0,0,.2)";
    }
    event.preventDefault();
}

function onDragLeave(event) {
    let div = document.getElementById("file-dragdrop");
    div.style.backgroundColor = "rgba(0,0,0,0)";
    event.preventDefault();
}


function onDragOver(event) {
    event.preventDefault();
}

function onDrop(event) {
    const data = event.dataTransfer.getData("text/plain");

    event.preventDefault();

    if (event.dataTransfer.items) {
        // Use DataTransferItemList interface to access the file(s)
        if (event.dataTransfer.items[0].kind === 'file') {
            var file = event.dataTransfer.items[0].getAsFile();
            console.log('... filename = ' + file.name);
            console.log(file);
            fileName = file.name;

            const reader = new FileReader();
            reader.addEventListener('load', (event) => {
                onReadTranslations(event.target.result);
            });
            reader.readAsText(file);

        }
    }
}



function saveFile() {

//    console.log(fileHeader + fileMiddle);


    /* Handle special translations */
    let fileSpecial = "";
    let maxMethodLength = Object.values(translations['special']).map( function(x) {return x.length} ).reduce(function(a, b) { return Math.max(a, b); });
    let maxTypeLength   = Object.keys(  translations['special']).map( function(x) {return x.length} ).reduce(function(a, b) { return Math.max(a, b); });
    for (key of Object.keys(translations['special']).sort()) {
        let t = translations['special'][key];
        fileSpecial +=
            "'" + key + "'" +
            (' ').repeat(maxTypeLength - key.length) +
            " => method {" + t +
            (' ').repeat(maxMethodLength - t.length)
            + "},\n";
    }

    /* Handle normal translations */
    let fileNormal = "";
    for (key of Object.keys(translations['normal']).sort()) {
        let t = "";
        /* Typename */
        t += "# Class:  " + translations['normal'][key]["type"] + "\n";
        /* Status */
        t += "# Status: " + translations['normal'][key]["status"] + "\n";
        /* Notes */
        let notes = translations['normal'][key]["note"].split("\n");
        if (notes[0]) { // if blank, first item is falsy
            t += "# Notes:  " + notes.join("\n#         ");
            t += "\n";
        }
        t += "# Original Code:\n#" + translations['normal'][key]["orig"].split("\n").join("\n# ") + "\n\n";
        t += "'" + translations['normal'][key]["type"] + "' => method {\n" + translations['normal'][key]["trans"] + "\n},\n\n\n\n";
        fileNormal += t;
    }

    download(fileName, fileHeader + fileSpecial + fileMiddle + fileNormal + ";");
}


function download(filename, text) {
  var e = document.createElement('a');
  e.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
  e.setAttribute('download', filename);

  e.style.display = 'none';
  document.body.appendChild(e);

  e.click();

  document.body.removeChild(e);
}



/* This will hold all of the test values.  Each script in test-values/
 * will populate it with their associated values
 */
var test = {};