require 'spec_helper'

describe Api::V1::UsersController do

  it 'correctly creates the new user' do
    api_params = { "name" => "John Doe", "email" => "john@doe.com",
        "password" => "s3kr3t", "password_confirmation" => "s3kr3t"}

    request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

    expect{
        post :create, api_params, request_headers

        expect(response).to be_success
        expect(response.status).to eq(200)

    }.to change(User,:count).by(1)

    expect(response.body).to eq(User.last.to_json)
  end

  it 'sends a proper error when missing a parameter' do
    api_params = {"email" => "john@doe.com",
        "password" => "s3kr3t", "password_confirmation" => "s3kr3t"}

    request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

    expect{
        post :create, api_params, request_headers

        expect(response.status).to eq(422)

    }.not_to change(User,:count)

    body = JSON.parse(response.body)
    expect(body["errors"]).to eq(assigns(:user).errors.full_messages)
  end
end
