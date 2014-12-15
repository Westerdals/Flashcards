var express = require('express');
var bodyParser = require('body-parser');

var Card = require('./card.js');

var app = express();

app.use(bodyParser.json());

app.use(express.static(__dirname + '/../client'));

app.get('/cards', function (req, res, next) {
    Card.find(function (err, cards) {
        if (err) return next(err);
        return res.json(cards);
    });
});

app.post('/cards', function (req, res, next) {
    var card = req.body;

    console.log(card);

    Card.create(card, function (err, card) {
        if (err) return next(err);
        return res.json(card);
    });
});

app.delete('/cards/:id', function(req, res, next) {
    var id = req.params.id;

    console.log('trying to delete :' + id);

    Card.findById(id, function(err, card) {
        if (err) return next(err);
        if (!card) return res.status(404).send();
        card.remove();
        res.status(204).send();
    });
});

app.listen(4321);
console.log('App listening on port 4321');

// clear cards
Card.remove({}, function(err) {
    if (err) return console.log(err);
    console.log("Cleared cards.");

    // insert stuff
    Card.create({"key": "Hva er tvang og makt?", "value": "Tiltak som tjenestemottaker motsetter seg, eller tiltak som er så inngripende at det uansett motstand må regnes som makt og tvang."});
    Card.create({"key": "Hva er diagnosekravet?", "value": "Psykisk utviklingshemmet."});
    Card.create({"key": "Hva er formålet med loven?", "value": "Å hindre at personer med psykisk utviklingshemning utsetter seg selv eller andre for vesentlig skade, og å forebygge og begrense bruk av tvang og makt."});
    Card.create({"key": "Er nedverdigende og krenkende behandling av tjenestemottakere forbudt ved lov?", "value": "Ja."});
    Card.create({"key": "Hvordan defineres etisk forsvarlighet i forhold til makt og tvang?", "value": "Tiltaket skal ikke vare lenger enn nødvendig – ikke mer enn nødvendig – tvangen må stå i forhold til det vedkommende har gjort."});
    Card.create({"key": "Hvor går grensen for bruk av makt og tvang?", "value": "Tiltaket må ikke bli en straff, eller gå over øvre grense for tvang, dvs. bruker metoder som i følge loven er ulovlige."});
    Card.create({"key": "Hva vil det si at tiltaket må være faglig forsvarlig?", "value": "Det må brukes anerkjente metoder som er forankret i fagkunnskap."});
    Card.create({"key": "Andre løsninger skal alltid være prøvd før en bruker makt/tvang. Hva menes med 'andre løsninger'?", "value": "Løst ved frivillighet og samarbeid, omgår bruk av makt ved tiltak som er utenfor tvangsbegrepet."});
    Card.create({"key": "Når kan du bruke makt og tvang?", "value": "Ved oppståtte og påregnelige nødssituasjoner. Når du vet at situasjonen vil oppstå, og det er fare for vesentlig skade."});
    Card.create({"key": "Hvilke begrensninger finner du i loven ved bruk av makt/tvang?", "value": "Bruk av makt og tvang skal begrenses til inngrep som er nødvendige for å hindre at skaden oppstår eller begrense vesentlig skade i en oppstått situasjon."});
    Card.create({"key": "Loven skiller mellom 2 formål med tiltak der tvang inngår, hva er de to formålene?", "value": "Skadeavverging i nødssituasjoner (enkeltstående eller gjentatte nødssituasjoner) og tiltak for å ivareta grunnleggende behov, herunder opplærings- og treningstiltak."});
    Card.create({"key": "Hvordan gjelder loven overfor barn?", "value": "Alminnelig barneoppdragelse som omsort og grensesetting reguleres ikke av kapittel 9, tiltak som er mer inngripende enn dette skal meldes inn som bruk av makt og tvang."});
    Card.create({"key": "Kan det brukes makt overfor en person som utøver fysisk skade på seg selv?", "value": "Kun dersom skaden er av varig karakter, som for eksempel uopprettelige sanseskader som følge av slag eller trykk mot ører eller øyne, skaden må anses som vesentlig."});
    Card.create({"key": "Hva er vesentlig skade?", "value": "At skaden må være vesentlig innebærer at den må ha et betydelig omfang og/eller ha alvorlige konsekvenser. Det er ikke avgjørende om atferden er avvikende eller uvanlig."});
    Card.create({"key": "Når skal du sende enkeltvedtak?", "value": "Hver gang det er brukt makt eller tvang."});
    Card.create({"key": "Hva er enkeltvedtak?", "value": "En skriftlig melding om bruk av makt/tvang/skadeavvergende tiltak. Meldingen skal skrives straks etter at tiltaket er gjennomført, og sendes skriftlig til den faglig ansvarlige for tjenesten, Fylkesmannen, verge, og pårørende."});
    Card.create({"key": "Kan det brukes makt for å unngå skade på personens egne eiendeler?", "value": "Nei, med mindre skaden er betydelig og/eller får et stort økonomisk omfang."});
    Card.create({"key": "Hva omfattes ikke av loven og er ikke aktuelt å bruke?", "value": "Trusler eller stemmebruk som er egnet til å skape frykt eller underkastelse omfattes ikke. Slike virkemidler kan uansett ikke regnes som faglig eller etisk forsvarlige."});
    Card.create({"key": "Hva regnes ikke som bruk av makt og tvang?", "value": "Alminnelige oppfordringer, ledelse med hånden. Det dreier seg om å gi beskjeder eller overtale tjenestemottakeren til å gjøre eller unnlate noe."});
    Card.create({"key": "Hva er viktig å vite når en skal prøve ut alternative løsninger?", "value": "Forsøke å finne frem til årsaken til den utfordrende atferden. I de tilfeller det er en spesiell årsak som er mulig å behandle med kjente metoder, skal dette gjennomføres først. Det gjelder for eksempel medisinsk behandling av somatiske og psykiatriske lidelser."});

    console.log('Inserted cards.');
});
