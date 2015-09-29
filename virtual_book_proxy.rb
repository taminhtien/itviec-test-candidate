require './book_store_connection'

class VirtualBookProxy
  def initialize(size)
    @pool_size = size
    current_pool_size
  end

  def connect
    if current_pool_size >= @pool_size
      raise "Over max poolsize"
    elsif no_available_connection?
      @current_pool_size += 1
      BookStoreConnection.new current_pool_size
    else
      @current_pool_size += 1
      book_store_connections.delete available_connection
    end
  end

  def release_connection(book_store_connection)
    if book_store_connections.include? book_store_connections
      raise "Try to release an available connection"
    else
      @current_pool_size -= 1
      #puts "Release connection.."
      @book_store_connections << book_store_connection
    end
  end

  protected
  def no_available_connection?
    book_store_connections.size <= 0
  end

  def available_connection
    book_store_connections.first
  end

  def book_store_connections
    @book_store_connections ||= []
  end

  def current_pool_size
    @current_pool_size ||= 0
  end
end

#virtual_book_proxy = VirtualBookProxy.new(3)

#book_store_connection1 = virtual_book_proxy.connect
#p book_store_connection1.id

#book_store_connection2 = virtual_book_proxy.connect
#p book_store_connection2.id

#book_store_connection3 = virtual_book_proxy.connect
#p book_store_connection3.id

#virtual_book_proxy.release_connection(book_store_connection2)

#book_store_connection4 = virtual_book_proxy.connect
#p book_store_connection4.id

#book_store_connection3 = virtual_book_proxy.connect
#p book_store_connection3.id

#p book_store_connection1.show(2)
