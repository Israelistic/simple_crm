require_relative "contact"

class CRM

  def initialize

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
    p  Contact.create(first_name, last_name, email, note = 'N/A')
  end

  def modify_existing_contact
    

  end

  def delete_contact

  end

  def display_all_contacts

  end

  def search_by_attribute

  end


end
