use v6;

unit module CSV;

grammar Parser {

    token TOP {
        <field> [ ',' <field> ]*
    }

    token field {
        <text> | <string>
    }

    token text {
        <-[ , " ]>*  # "]
    }

    token string {
        '"' [ '""' | <-[ " ]> ]* '"' # syntax highlighter garbage -> ' ] ]
    }

    class Actions {

        method TOP($/) { make $<field>.map(*.made) }

        method field($/) {
            make $<text>.made // $<string>.made
        }

        method text($/) {
            make ~$/;
        }

        method string($val) {
            $val.make: (~$val).trans(/^\"/ =>'', /\"$/ => '', /\"\"/ => '"'); # '
        }
    }

    method parse(|c) { nextwith(actions => Actions, |c); }
}

