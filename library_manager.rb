class Book
  attr_accessor :book_name, :author, :isbn, :status

  #book is basicalla a idea and with this idea we will be creating book object
  #initializing the object with attributes/properties 
  def initialize(book_name, author, isbn)
    @book_name = book_name
    @author = author
    @isbn = isbn
    @status = "available" #by default value i.e when new book is added to the library it is available for use
    #above values are the properties that a book object posses
  end

  #status is a label that will be modified by another object i.e library which we will create later
  #lets add method to change the status of the book. as this is the operation task performed on book object
  def issue_book
    if @status == "available"
      @status = "checked out"
      puts "Book #{@book_name} has been issued."
    else
      puts "Unable to process request, #{book_name} is not available"
    end
  end

  def return_book
    if @status == "checked out"
      @status = "available"
      puts "#{@book_name} has been returned"
    else
      puts "Unable to perform desired action."
    end
  end

  def display
    "Name: #{@book_name} | Author: #{@author} | ISBN: #{@isbn} | Status: #{@status}"
  end

end
