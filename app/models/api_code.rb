# typed: strict
# frozen_string_literal: true

class ApiCode < T::Enum
  enums do
    NOT_FOUND = new("NOT_FOUND")
    INTERNAL_SERVER = new("INTERNAL_SERVER")
  end
end
