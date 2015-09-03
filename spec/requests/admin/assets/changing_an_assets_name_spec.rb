require 'spec_helper'

describe "Changing an asset's name in the asset editor", type: :request, js: true do
  let! :asset do
    Asset.make file: file_fixture
  end

  before do
    sign_in_as_admin
    visit admin_assets_path
    hover_over_asset_thumb
    click_on 'Edit'
    fill_in 'name', with: 'Cute Ladybug'
    click_on 'Save Changes'
  end

  it "closes the editor" do
    expect(page).to have_no_css ".asset-editor"
  end

  it "updates the name in the thumb" do
    hover_over_asset_thumb
    expect(page).to have_css '.asset-details .filename', text: 'Cute_Ladybug.jpg'
  end
end
