require 'rails_helper'

RSpec.describe Book do
  it 'exists' do
    book = Book.new(id: "ZV9DDwAAQBAJ",
            title: "Pride",
            authors: ["Ibi Zoboi"],
            genres: [
            "Young Adult Fiction / Diversity & Multicultural",
            "Young Adult Fiction / Social Themes / Class Differences",
            "Young Adult Fiction / Romance / Contemporary"],
            description: "In a timely update of Jane Austen's Pride and Prejudice, National Book Award finalist Ibi Zoboi skillfully balances cultural identity, class, and gentrification against the heady magic of first love in her vibrant reimagining of this beloved classic. A smart, funny, gorgeous retelling starring all characters of color.",
            rating: 3)

    expect(book).to be_an_instance_of(Book)
    expect(book.id).to eq("ZV9DDwAAQBAJ")
    expect(book.title).to eq("Pride")
    expect(book.authors).to eq(["Ibi Zoboi"])
    expect(book.genres).to eq([
    "Young Adult Fiction / Diversity & Multicultural",
    "Young Adult Fiction / Social Themes / Class Differences",
    "Young Adult Fiction / Romance / Contemporary"])
    expect(book.description).to eq("In a timely update of Jane Austen's Pride and Prejudice, National Book Award finalist Ibi Zoboi skillfully balances cultural identity, class, and gentrification against the heady magic of first love in her vibrant reimagining of this beloved classic. A smart, funny, gorgeous retelling starring all characters of color.")
    expect(book.rating).to eq(3)
  end
end
