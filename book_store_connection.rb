class BookStoreConnection
  def initialize(id)
    connect
    @id = id
  end

  def download(id)
    sleep 2
    puts link id
  end

  def show(id)
    sleep 2
    if exist?(id)
        "===============" \
        "Book Content" \
        "ID: #{id}"
    end
  end

  def exist?(id)
    true if book_ids.include?(id)
  end

  def books
    sleep 3
    book_ids
  end

  def add_book(id)
    sleep 5
    book_ids << id unless book_ids.include?(id)
  end

  def id
    @id
  end

  protected

  def book_ids
    sleep 1
    @book_ids ||= [1, 2, 3, 4, 5]
  end

  # connect to BookStore
  def connect
    print "Connect to Book Store... "
    sleep 5
    print "Done.\n"
  end

  def link(id)
    exist?(id) ? ("Link download for book with id  = %{id} http://book.com/download?id=%{id}" % {id: id}) : "No available link"
  end
end
