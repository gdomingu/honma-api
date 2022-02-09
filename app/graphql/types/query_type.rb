module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :dialect, Types::DialectType, null: false do
      description 'Find a dialect by ID'
      argument :id, ID, required: true
    end

    def dialect(id:)
      Dialect.find(id)
    end

    field :place_infos, [Types::PlaceInfoType], null: false do
      description 'Find place infos by dialect id'
      argument :dialect_id, ID, required: true
    end

    def place_infos(dialect_id:)
      PlaceInfo.where(dialect_id: dialect_id)
    end
  end
end
