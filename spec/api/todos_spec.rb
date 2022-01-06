require 'swagger_helper'

describe 'Todos' do
    path '/todos' do
        get 'Get all your todos with their items.' do
            tags 'Todos'
            parameter name: :Authorization, in: :header, required: true, type: :string

            response '200', 'Receive your todos' do
                let(:Authorization) { "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2NDE0ODQ2MzF9.TVbPHn8JeBYSURyk337oTBjMgaVxJ_qfXAySZb9lUEQ"}
                run_test!
            end
        end

        post 'Create a new todo.' do
            tags 'Todos'
            parameter name: :Authorization, in: :header, required: true, type: :string
            parameter name: :todo, in: :body, schema: {
                type: :object,
                properties: {
                    title: { type: :string }
                },
                required: ['title']
            }

            response '200', 'Create a new todo.' do
                let(:Authorization) { "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2NDE0ODQ2MzF9.TVbPHn8JeBYSURyk337oTBjMgaVxJ_qfXAySZb9lUEQ"}
                let(:todo) {
                    {
                        title: 'Test todo'
                    }
                }
                run_test!
            end
        end
    end

    path '/todos/{id}' do
        put 'Change an existing todo.' do
            tags 'Todos'
            parameter name: :id,in: :path, type: :string, required: true
            parameter name: :title,in: :body,schema: {
                type: :object,
                properties: {
                    title: {type: :string} 
                },
                required: ['title']
            }
            parameter name: :Authorization, in: :header, required: true, type: :string

            response '204', 'Todo was updated successfully.' do
                let(:Authorization) { "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2NDE0ODQ2MzF9.TVbPHn8JeBYSURyk337oTBjMgaVxJ_qfXAySZb9lUEQ"}
                let(:id) {Todo.create(title: 'Test').id} 
                let(:title) {
                    {
                        title: 'Testy test'
                    }
                }
                run_test!
            end
        end

        delete 'Delete a  todo.' do
            tags 'Todos'
            parameter name: :id,in: :path, type: :string, required: true
            parameter name: :Authorization, in: :header, required: true, type: :string

            response '204', 'Todo was deleted.' do
                let(:Authorization) { "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2NDE0ODQ2MzF9.TVbPHn8JeBYSURyk337oTBjMgaVxJ_qfXAySZb9lUEQ"}
                let(:id) { Todo.create(title: 'Test').id}
                run_test!
            end
        end
    end
end