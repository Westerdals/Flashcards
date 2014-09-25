package no.wact.flashcards.resource;

import no.wact.flashcards.repository.Repository;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

@Path("/cards")
public class CardResource
{
    @Inject
    private Repository repository;

    @GET
    @Produces("application/json;charset=UTF-8")
    public Response getCards()
    {
        return Response.ok(repository.getAllCards()).build();
    }
}
