package no.wact.flashcards.config;

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.ext.Provider;
import java.io.IOException;

@Provider
public class CorsFilter implements javax.ws.rs.container.ContainerResponseFilter
{
    @Override
    public void filter(final ContainerRequestContext containerRequestContext, final ContainerResponseContext containerResponseContext) throws IOException
    {
        containerResponseContext.getHeaders().add("Access-Control-Allow-Origin", "*");
        containerResponseContext.getHeaders().add("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE, HEAD");
        containerResponseContext.getHeaders().add("Access-Control-Allow-Headers", "X-PINGOTHER, Origin, X-Requested-With, Content-Type, Accept");
        containerResponseContext.getHeaders().add("Access-Control-Max-Age", "1728000");
    }

}
