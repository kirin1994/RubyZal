json.extract! user, :id, :imie, :nazwisko, :wiek, :ulica, :miasto, :kod_pocztowy, :Informacje_dodatkowe, :created_at, :updated_at
json.url user_url(user, format: :json)