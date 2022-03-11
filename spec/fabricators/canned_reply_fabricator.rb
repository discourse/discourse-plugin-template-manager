# frozen_string_literal: true

Fabricator(:canned_reply, from: :topic) do
  transient :content

  title { sequence(:title) { |i| "This is a test canned reply #{i}" } }

  after_create do |topic, transients|
    Fabricate(:post, topic: topic) do
      raw { transients[:content] ? transients[:content] : sequence(:title) { |i| "This is the content of an awesome canned reply #{i}" } }
    end
  end
end

Fabricator(:random_canned_reply, from: :canned_reply) do
  title { "This is a test canned reply #{rand(999999).to_s.rjust(6, '0')}" }
end
