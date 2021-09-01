ap "test api unsplash ici"

        base_url = "https://api.unsplash.com/photos/random"
        key_access = "/?client_id=_VHzHxfpY4G4UfEfQsg42fp3LdvNko_8IZPFDL9_O9I"
        # query = "kayak" --> &query=#{query}

        response = "#{base_url}#{key_access}"
        # https://api.unsplash.com/photos/random/?client_id=_VHzHxfpY4G4UfEfQsg42fp3LdvNko_8IZPFDL9_O9I
        doc = JSON.parse(response)
        ap doc.size

        image = doc[:urls][:small]
        ap image
