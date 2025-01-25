require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:file) { fixture_file_upload('test_image.jpg', 'image/jpg') }

  describe 'GET #show' do
    before { get :show, params: { username: user.username } }

    it 'assigns @user' do
      expect(assigns(:user)).to eq(user)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'PATCH #update_avatar' do
    context 'with valid params' do
      before do
        sign_in user
      end

      it 'updates user avatar' do
        patch :update_avatar, params: {
          username: user.username,
          user: { avatar: file }
        }

        expect(user.reload.avatar).to be_attached
        expect(flash[:success]).to eq('Avatar updated!')
      end

      it 'handles turbo_stream format' do
        patch :update_avatar, params: {
          username: user.username,
          user: { avatar: file },
          format: :turbo_stream
        }

        expect(response).to render_template(:update)
        expect(flash.now[:success]).to eq('Avatar was successfully updated!')
      end
    end
  end
end
