class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    # self.partner = person
    # person.partner = self
    self.partner = person
    if person.class != Person
      begin #beginning of exception
        raise PartnerError # raises PartnerError if the condition is true (when get_married is not an instance of person)
      rescue PartnerError => error #_rescue_ begins instance of PartnerError called error
          puts error.message #runs message in PartnerError
      end #begin to end
    else
      person.partner = self
    end
  end

  class PartnerError < StandardError #PartnerError inherits from StandardError, which contains NameError, which contains _NoMethodError_
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end

end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name
