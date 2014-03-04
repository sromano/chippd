require 'spec_helper'

describe User do
  fixtures :users

  it "fails validation with no name (using error_on)" do
    #This is just an example for the Exercise, I do not recommend testing rails validations defined in the model
    #that is why I'm not testing email formats nor other required attribute in the model
    expect(User.create).to have(1).error_on(:name)
  end

  it "shows only the specific attributes in json" do
    user = users(:first)

    json_string = {
        :id  => user.id,
        :name     => user.name,
        :email    => user.email,
        :authentication_token => user.authentication_token
    }.to_json

    expect(user.to_json).to eq(json_string)
  end
end
