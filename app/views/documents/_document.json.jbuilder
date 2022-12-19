json.extract! document, :id, :title, :fileName, :savePath, :created_at, :updated_at
json.url document_url(document, format: :json)
