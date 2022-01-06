require 'swagger_helper'

describe 'Authentication' do
    path '/signup' do
        post 'Create a new User' do
            tags 'Authentication'
            parameter name: :user, in: :body,required: true,schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    email: { type: :string },
                    password: { type: :string },
                    password_confirmation: { type: :string }
                },
                required: ['name','email','password','password_confirmation']
            }

            response '201', 'User was successfully created and an Auth key was received.' do
                let(:user) {
                    {
                        name: 'rndusrnm',
                        email: 'rndemail@gmail.com',
                        password: 'foobar',
                        password_confirmation: 'foobar'
                    }
                }
                run_test!
            end

            response '422', "Validation failed: Password can't be blank, Password digest can't be blank" do
                let(:user) {
                    {
                        name: 'rndusrnm',
                        email: 'rndemail@gmail.com'
                    }
                }
                run_test!
            end
        end
    end

    path '/auth/login' do
        post 'Sign in and receive your Auth key' do
            tags 'Authentication'
            parameter name: :user,in: :body,required: true,schema: {
                type: :object,
                properties: {
                    email: {type: :string},
                    password: {type: :string},
                    required: ['email','password']
                }
            }

            response '200', "Sign in was successful. Get your Auth key." do
                let(:user) {
                    {
                        email: 'rndemail@gmail.com',
                        password: 'foobar'
                    }
                }
                run_test!
            end

            response '401', 'Invalid credentials.' do
                let(:user) {
                    {
                        email: 'rndemail@gmail.com',
                        password: 'foobarasdfasd'
                    }
                }
                run_test!
            end
        end
    end
end