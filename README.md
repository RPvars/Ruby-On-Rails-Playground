# README

# DEKORĀTORS
    Dekorātors atbild par izvades datu noformēšanu/dekorēšanu lai tas nebūtu jādara kontrolierī vai modelī, šeit ir citas atbildības.
    Atbrīvo controller un model failus no liekā koda.

    Piemērs:
        def full_name
            name + ' ' + surname
        end

# FORM OBJEKTS
    Atbild par ienākošās informācijas pārbaudi, noformēšanu un pārveidošanu
    Atbrīvo controller un model failus no liekā koda.

    Piemērs:
        validates :name, :surname, :email, presence: true
        validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }