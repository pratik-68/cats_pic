require 'rails_helper'

RSpec.describe "Api::V1::CatsPic", type: :request do
  let(:image) { fixture_file_upload(Rails.root.join("spec/files/sample.jpg"))}

  describe "GET /index" do
    it "returns all cat pics" do
      cat_pic = CatPic.create!(title: "Title", description: "Image", image: image)

      get "/api/v1/cats_pic"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).first["id"]).to eq(cat_pic.id)
    end
  end

  describe "GET /show" do
    it "returns a single cat pic" do
      cat_pic = CatPic.create!(title: "Pic 1", description: "Image 1", image: image)

      get "/api/v1/cats_pic/#{cat_pic.id}"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq(cat_pic.id)
    end

    it "return 404 if not found" do
      get "/api/v1/cats_pic/9999"
      expect(response).to have_http_status(404)
    end
  end

  describe "POST /create" do
    it "creates a cat pic with image" do
      post '/api/v1/cats_pic',
        params: { title: "Cat 1", description: "Cute", image: image}

      expect(response).to have_http_status(201)
      expect(JSON.parse(response.body)["title"]).to eq("Cat 1")
    end
  end

  describe "PUT /update" do
    it "creates a cat pic with image" do
      cat_pic = CatPic.create!(title: "Pic 1", description: "Image 1", image: image)

      put "/api/v1/cats_pic/#{cat_pic.id}",
        params: { title: "Pic 2", description: "Image 2", image: image}

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["title"]).to eq("Pic 2")
    end
  end

  describe "DELETE /destroy" do
    let(:cat_pic) { CatPic.create!(title: "Title", description: "Image", image: image) }

    it "deletes the cat pic" do
      expect(CatPic.exists?(cat_pic.id)).to eq(true)

      delete "/api/v1/cats_pic/#{cat_pic.id}"
      expect(CatPic.exists?(cat_pic.id)).to be_falsey
    end
  end
end
