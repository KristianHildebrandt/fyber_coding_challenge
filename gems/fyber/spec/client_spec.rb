require "spec_helper"

module Fyber
  describe Client do
    describe "offer_wall" do
      context "when successful" do
        let(:params) do
          {
            format: 'json',
            appid: 157,
            locale: 'en',
            os_version: '7.0',
            timestamp: Time.now.to_i,
            apple_idfa: '2b6f0cc904d137be2e1730235f5664094b83',
            apple_idfa_tracking_enabled: true,
            ip: '109.235.143.113',
            offer_types: 112
          }
        end

        let(:response) do
          VCR.use_cassette("offer_wall") do |cassette|
            Timecop.freeze(cassette.originally_recorded_at || Time.now) do
              return Client.offer_wall(params.merge({"page" => '', "pub0" => "", "uid" => "player1"}))
            end
          end
        end

        %w(code message count pages information information).each do |attr|
          it "contains the #{attr}" do
            expect(response).to have_key(attr)
          end
        end

        it "returns a list of offers" do
          expect(response['offers']).to be_an(Array)
          expect(response['offers'].count).to be > 1
        end

        %w(title thumbnail thumbnail payout).each do |attr|
          it "contains each offer's #{attr}" do
            response['offers'].each do |offer|
              expect(offer).to have_key(attr)
            end
          end
        end
      end
    end
  end
end
