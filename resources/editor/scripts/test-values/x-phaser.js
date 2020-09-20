/* Test values for the X::Phaser name space */

/* condition is arbitrary code, phaser can be PRE or POST */
test["X::Phaser::PrePost"] = [
        {
            'condition' : `"say 'hello'"`,
            'phaser' : `"PRE"`
        },
        {
            'condition' : `"$*OUT.say: ':-('"`,
            'phaser' : `"POST"`
        }
    ]
};