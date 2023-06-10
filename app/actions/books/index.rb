# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Index < Bookshelf::Action
        include Deps["persistence.rom"]

        def handle(*, response)
          # Accessing relations directly from actions is not a commonly recommended pattern. 
          # Instead, a rom repository should be used. Here, however, the repository is ommitted for brevity.
          books = rom.relations[:books]
            .select(:title)
            .order(:title)
            .to_a

          response.format = :json
          response.body = books.to_json
        end
      end
    end
  end
end
