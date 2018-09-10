# frozen_string_literal: true

RSpec.describe Spid::Sinatra::Helpers do
  before do
    Spid.configure do |config|
      config.login_path = "/spid/login"
      config.logout_path = "/spid/logout"
    end
  end

  let(:dummy_class) do
    Class.new do
      include Spid::Sinatra::Helpers
    end
  end

  let(:dummy_object) { dummy_class.new }

  describe ".spid_login_path" do
    let(:url) do
      dummy_object.spid_login_path(params)
    end

    let(:params) { { idp_name: "https://identity.provider" } }

    context "when only identity provider entity id is provided" do
      it "returns the url with parameters" do
        expect(url).to eq "/spid/login?idp_name=https://identity.provider"
      end
    end

    context "when an authn context is provided" do
      let(:params) do
        super().merge(authn_context: Spid::L2)
      end

      it "returns the url with parameters" do
        expect(url).
          to eq "/spid/login?idp_name=https://identity.provider" \
                "&authn_context=https://www.spid.gov.it/SpidL2"
      end
    end

    context "when an attribute service is provided" do
      let(:params) do
        super().merge(attribute_service_index: 1)
      end

      it "returns the url with parameters" do
        expect(url).
          to eq "/spid/login?idp_name=https://identity.provider" \
                "&attribute_service_index=1"
      end
    end

    context "with all attributes" do
      let(:params) do
        {
          idp_name: "https://identity.provider",
          attribute_service_index: 2,
          authn_context: Spid::L3
        }
      end

      it "returns the full url" do
        expect(url).
          to eq "/spid/login?idp_name=https://identity.provider" \
                "&authn_context=https://www.spid.gov.it/SpidL3" \
                "&attribute_service_index=2"
      end
    end
  end

  describe ".spid_logout_path" do
    let(:url) do
      dummy_object.spid_logout_path(
        idp_name: "https://identity.provider"
      )
    end

    it "returns the logout url with parameters" do
      expect(url).
        to eq "/spid/logout?idp_name=https://identity.provider"
    end
  end
end
