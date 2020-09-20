function init() {
  const fileSelector = document.getElementById('file-selector');
  fileSelector.addEventListener('change', (event) => { onChooseFile(event.target.files[0]) } );
  document.getElementById('generateSamples').addEventListener('click', (event) => { onGenerateMessages() } );

  /* allow for auto resizing of the textarea */
  document.getElementById('normal-translation').addEventListener('change', resizeTextArea );
  document.getElementById('normal-translation').addEventListener('keydown', resizeTextArea );

}

function onChooseFile(file) {
    const fileName = file.fileName;
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
    while (lines[lineNº].indexOf('# BEGIN SPECIAL TRANSLATIONS ') == -1) { lineNº++; }

    /* Increment by one and we're on the first line */
    lineNº++;

    while (special = lines[lineNº].match(specialTranslations)) {
        translations['special'][special[1]] = special[2];
        lineNº++;
    }

    /* We should be at the end, but scan to the end to be sure */
    while (lines[lineNº].indexOf('# END SPECIAL TRANSLATIONS ') == -1) { lineNº++; }

    /* Increment by one and we can start teasing out regular translations */
    lineNº++;

    /* When blank, we need to find them */
    let type   = "";
    let status = "";
    let note   = "";
    let orig   = "";
    let trans  = "";
    let m;

    while (lineNº < lines.length) {
        let line = lines[lineNº++];
        if ((type == "") && (m = line.match(typeLine))) {
            type = m[1];
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

    document.getElementById('intro').style.visibility = "hidden";
    document.getElementById('x-selector').style.visibility = "visible";
    document.getElementById('normal-table').style.visibility = "visible";
}

function onChooseException(event) {
    if (event.target.selectedIndex <= event.target.childNodes[0].childNodes.length) {
        onChooseSpecialException(event);
    }else{
        onChooseNormalException(event);
    }
}

function onChooseSpecialException(event) {
    let idx = event.target.selectedIndex;
    let type = event.target[idx].value;
    let trans = translations['special'][type];
}
var currentType;

function onChooseNormalException(event) {
    let idx = event.target.selectedIndex;
    let type = currentType = event.target[idx].value;
    let x = translations['normal'][type];

    document.getElementById("normal-type").innerHTML = x.type;
    document.getElementById("normal-status").value = x.status;
    document.getElementById("normal-original").innerHTML = "    method message (" + x.type + ":D:) {\n" + x.orig + "\n    }";
    document.getElementById("normal-notes").innerHTML = x.note;
    document.getElementById("normal-translation").value = x.trans;
    document.getElementById("trans-type-name").innerHTML = x.type;
    resizeTextArea();
}

/* ugly as sin lol */
const jsEnc = "sub js-enc($s) { my $t = [~] do for $s.comb { given $_ { when '\"' { '\\\"' }; when '\\\\' { '\\\\\\\\' }; when \"\\n\" { '\\\\n' }; default {$_}}};'\"'~$t~'\"';}\n";


function onGenerateMessages(event) {
    if (Raku.state != "Ready") {
        Raku.init( function () {onGenerateMessages(event)} );
        return;
    }

    console.log("Generating output");

    /* Clear the current output */
    document.getElementById('output').textContent = "";

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
        testClass += ")";

        console.log("Calling the following:")
        console.log(methodDef + testClass + ".&test-method.say");
        /* Actually run the method.  $*OUT is captured in JS's fromRaku() */
        Raku.eval(methodDef + testClass + ".&test-method.say");
    }

}

function fromRaku(text, chan) {
    document.getElementById('output').textContent += text + "\n";
}

Raku.output = function(text, chan) { fromRaku(text, chan) };

function jsToRakuArgs(args) {
    let rakuArgs;
    for (key of Objects.keys(args)) {
        rakuArgs += key + " => " + args[key] + ", ";
    }
}

function resizeTextArea() {

    let text = document.getElementById("normal-translation");
    text.style.height = "auto";
    console.log("resizing with scrollHeight " + text.scrollHeight);
    text.style.height = (text.scrollHeight + 0) + "px";
    document.getElementById("normal-translation-cell").style.height = (text.scrollHeight + 0) + "px";

}


var test = {
    "X::Phaser::PrePost" : [
        {
            'condition' : `"say 'hello'"`,
            'phaser' : `"PRE"`
        },
        {
            'condition' : `"$*OUT.say: ':-('"`,
            'phaser' : `"POST"`
        }
    ]
}