package no.wact.flashcards.repository;

import javax.enterprise.context.ApplicationScoped;
import java.util.Arrays;
import java.util.List;

@ApplicationScoped
public class CardRepository implements Repository
{
    public List<Card> getAllCards()
    {
        return Arrays.asList(
                new Card("Hva er tvang og makt?", "Tiltak som tjenestemottaker motsetter seg, eller tiltak som er så inngripende at det uansett motstand må regnes som makt og tvang."),
                new Card("Hva er diagnosekravet?", "Psykisk utviklingshemmet."),
                new Card("Hva er formålet med loven?", "Å hindre at personer med psykisk utviklingshemning utsetter seg selv eller andre for vesentlig skade, og å forebygge og begrense bruk av tvang og makt."),
                new Card("Er nedverdigende og krenkende behandling av tjenestemottakere forbudt ved lov?", "Ja."),
                new Card("Hvordan defineres etisk forsvarlighet i forhold til makt og tvang?", "Tiltaket skal ikke vare lenger enn nødvendig – ikke mer enn nødvendig – tvangen må stå i forhold til det vedkommende har gjort."),
                new Card("Hvor går grensen for bruk av makt og tvang?", "Tiltaket må ikke bli en straff, eller gå over øvre grense for tvang, dvs. bruker metoder som i følge loven er ulovlige."),
                new Card("Hva vil det si at tiltaket må være faglig forsvarlig?", "Det må brukes anerkjente metoder som er forankret i fagkunnskap."),
                new Card("Andre løsninger skal alltid være prøvd før en bruker makt/tvang. Hva menes med 'andre løsninger'?", "Løst ved frivillighet og samarbeid, omgår bruk av makt ved tiltak som er utenfor tvangsbegrepet."),
                new Card("Når kan du bruke makt og tvang?", "Ved oppståtte og påregnelige nødssituasjoner. Når du vet at situasjonen vil oppstå, og det er fare for vesentlig skade."),
                new Card("Hvilke begrensninger finner du i loven ved bruk av makt/tvang?", "Bruk av makt og tvang skal begrenses til inngrep som er nødvendige for å hindre at skaden oppstår eller begrense vesentlig skade i en oppstått situasjon."),
                new Card("Loven skiller mellom 2 formål med tiltak der tvang inngår, hva er de to formålene?", "Skadeavverging i nødssituasjoner (enkeltstående eller gjentatte nødssituasjoner) og tiltak for å ivareta grunnleggende behov, herunder opplærings- og treningstiltak."),
                new Card("Hvordan gjelder loven overfor barn?", "Alminnelig barneoppdragelse som omsort og grensesetting reguleres ikke av kapittel 9, tiltak som er mer inngripende enn dette skal meldes inn som bruk av makt og tvang."),
                new Card("Kan det brukes makt overfor en person som utøver fysisk skade på seg selv?", "Kun dersom skaden er av varig karakter, som for eksempel uopprettelige sanseskader som følge av slag eller trykk mot ører eller øyne, skaden må anses som vesentlig."),
                new Card("Hva er vesentlig skade?", "At skaden må være vesentlig innebærer at den må ha et betydelig omfang og/eller ha alvorlige konsekvenser. Det er ikke avgjørende om atferden er avvikende eller uvanlig."),
                new Card("Når skal du sende enkeltvedtak?", "Hver gang det er brukt makt eller tvang."),
                new Card("Hva er enkeltvedtak?", "En skriftlig melding om bruk av makt/tvang/skadeavvergende tiltak. Meldingen skal skrives straks etter at tiltaket er gjennomført, og sendes skriftlig til den faglig ansvarlige for tjenesten, Fylkesmannen, verge, og pårørende."),
                new Card("Kan det brukes makt for å unngå skade på personens egne eiendeler?", "Nei, med mindre skaden er betydelig og/eller får et stort økonomisk omfang."),
                new Card("Hva omfattes ikke av loven og er ikke aktuelt å bruke?", "Trusler eller stemmebruk som er egnet til å skape frykt eller underkastelse omfattes ikke. Slike virkemidler kan uansett ikke regnes som faglig eller etisk forsvarlige."),
                new Card("Hva regnes ikke som bruk av makt og tvang?", "Alminnelige oppfordringer, ledelse med hånden. Det dreier seg om å gi beskjeder eller overtale tjenestemottakeren til å gjøre eller unnlate noe."),
                new Card("Hva er viktig å vite når en skal prøve ut alternative løsninger?", "Forsøke å finne frem til årsaken til den utfordrende atferden. I de tilfeller det er en spesiell årsak som er mulig å behandle med kjente metoder, skal dette gjennomføres først. Det gjelder for eksempel medisinsk behandling av somatiske og psykiatriske lidelser.")
        );
    }
}
