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
                new Card("Key 1", "Value 1"),
                new Card("Key 2", "Value 2")
        );
    }
}
