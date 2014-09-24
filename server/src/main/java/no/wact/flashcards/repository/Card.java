package no.wact.flashcards.repository;

public class Card
{
    private String keyword;
    private String description;

    public Card(final String keyword, final String description)
    {
        this.keyword = keyword;
        this.description = description;
    }

    public String getKeyword()
    {
        return keyword;
    }

    public void setKeyword(final String keyword)
    {
        this.keyword = keyword;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(final String description)
    {
        this.description = description;
    }
}
