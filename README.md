# README

# DEKORĀTORS
    Dekorātors atbild par izvades datu noformēšanu/dekorēšanu lai tas nebūtu jādara kontrolierī vai modelī, šeit ir citas atbildības.

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

# PRESENTER
    Atbild par izvades datu noformēšanu/prezentēšanu lai tas nebūtu jādara kontrolierī vai modelī.


# PRESENTER VS DECORATOR
    - Dekorātors ļauj piekļūt oriģinālā objekta metodēm ar delegator palīdzību, bet presenter neļauj piekļūt oriģinālā objekta metodēm
    -