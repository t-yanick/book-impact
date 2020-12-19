# frozen_string_literal: true

json.extract! opinion, :id, :feedback, :created_at, :updated_at
json.url opinion_url(opinion, format: :json)
