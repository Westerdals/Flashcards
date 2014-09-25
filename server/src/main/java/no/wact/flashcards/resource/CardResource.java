package no.wact.flashcards.resource;

import no.wact.flashcards.repository.Card;
import no.wact.flashcards.repository.Repository;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import java.util.List;

@Path("/cards")
public class CardResource
{
    @Inject
    private Repository repository;

    @GET
    @Produces("application/json;charset=UTF-8")
    public List<Card> getCards()
    {
        return repository.getAllCards();
    }
}
