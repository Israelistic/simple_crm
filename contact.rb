require 'pry'
class Contact
  @@contacts = []
  @@next_id = 100
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = 'N/A')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@next_id
    @@next_id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note = 'N/A')
    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end
  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do | contact |
        if contact.id == id
          return contact
        end
     end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    case attribute
    when "1"
      @first_name = new_value
    when "2"
      @last_name = new_value
    when "3"
      @email = new_value
    when "4"
      @note = new_value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value);
    case attribute
    when "1"
      @@contacts.each do |contact|
        if contact.first_name.downcase == value.downcase
          return p contact
        end
      end
    when "2"
      @@contacts.each do |contact|
        if contact.last_name.downcase == value.downcase
          return p contact
        end
      end
    when "3"
      @@contacts.each do |contact|
        if contact.email.downcase.downcase == value.downcase
         return p contact
        end
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
     @@contacts.each { | contact |  contacts.delete_at(contact)}
  end

  def full_name;
    return "#{@first_name} #{@last_name} "
  end
  def id
    return @id
  end
  def last_name
    @last_name
  end
  def first_name
    @first_name
  end
  def email
    @email
  end
  def note
    @note
  end
  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(contact)
    @@contacts.delete(contact)
  end
  # def multigetter
  #   case
  #   when "1"
  #     return @first_name
  #   when "2"
  #     return @last_name
  #   when "3"
  #     return @email
  #   when "4"
  #     return @note
  # end
end  # Feel free to add other methods here, if you need them.



p " TEST create"
p Contact.create("Haggai", "Lerman", "haguyle@gmail.com", "DevOps Engineer")
p Contact.create("Keren", "Lerman", "Epstein@gmail.com", "Techer")
p "=============="
p "TEST all"
p Contact.all
p "=============="
p "test find"
p Contact.find(101).full_name
