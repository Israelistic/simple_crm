require_relative 'contact'

class Crm

  def initialize(name)
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end

  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Delete all contacts'
    puts '[7] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    puts "\e[H\e[2J"
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then p Contact.all
    when 5 then search_by_attribute
    when 6 then delete_all
    when 7 then exit
    end
  end

  def add_new_contact
    puts "\e[H\e[2J"
    p "Enter First Name"
    first_name = gets.chomp
    p "Enter Last Name"
    last_name = gets.chomp
    p "Enter Email Address"
    email = gets.chomp
    p "Enter note: optional"
    note = gets.chomp
    p  Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "what is the name of the user first, lastname, email you would like to change"
    value = gets.chomp
    modify_menu
    attribute = gets.chomp
    if attribute == "4"
      return
    else
      puts "Enter the new value"
      new_value = gets.chomp
      Contact.find_by(attribute, value).update(attribute, new_value)
    end
  end

  def modify_menu
    puts "\e[H\e[2J"
    puts "please select an attribute to modify:"
    puts "[1] First_name"
    puts "[2] Last_name"
    puts "[3] Email"
    puts "[4] back"
  end

  def delete_contact

  end

  def display_all_contacts
      all
  end

  def search_by_attribute
    search_by_menu
    puts "what is the name of the user first, lastname, email, note"
    user_value = gets.chomp
    puts "\e[H\e[2J"
    p  Contact.find_by(contact_attribute, user_value)
    if (contact_attribute == 4 )
        Contact.find_by(contact_attribute, contact.update(contact_attribute, new_value))
    elsif (contact_attribute == 5)
       print_main_menu
    end
  end
  def search_by_menu
     puts "\e[H\e[2J"
     puts "please select an attribute to search by:"
     puts "[1] First_name"
     puts "[2] Last_name"
     puts "[3] Email"
     puts "[4] full_name"
     puts "[5] back"
   end

end


crm1 = Crm.new("CRM.APP")
crm1.main_menu
