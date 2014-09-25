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
                new Card("Aktivaklasser", "Ulike typer verdipapirer,som for eksempel aksjer, obligasjoner, råvarer og eiendom."),
                new Card("Allokering", "Allokeringsfunksjonen består i å fordele de midler som skal investeres på ulike markeder og aktivaklasser. Taktisk aktivaallokering består således i å velge andre aktiva- eller markedssammensetninger enn i referanseporteføljen, med sikte på å oppnå høyere avkastning."),
                new Card("Anke", "Bringe en sak inn til ny behandling for en høyere domstol."),
                new Card("Annuietslån", "Et lån der summen av renter og avdrag er den samme ved hver betalingstermin. I begynnelsen utgjør renten en stor og avdraget en liten del av det beløp (annuiteten) som betales ved hver termin. Etter hvert som gjelden reduseres, blir rentebeløpet stadig lavere og avdraget tilsvarende større."),
                new Card("Ansvarsforsikring", "En forsikring som dekker det økonomiske erstatningsansvar man har for skader man påfører andre (personer eller gjenstander). For privatpersoner er dette ansvaret gjerne dekket gjennom hjemforsikring eller villaeierforsikring. For et firma er det vanlig å tegne særskilte ansvarsforsikringer, der premien vil variere med forsikringsbeløp og typen av ansvar."),
                new Card("Appresiering", "Verdiøkning, det motsatte av depresiering. Ordet brukes særlig på valutaområdet, spesielt om kursstigning på en valuta (i forhold til andre valutaer) som følge av økt etterspørsel i markedet.")
        );
    }
}
