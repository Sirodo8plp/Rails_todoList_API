describe 'Items' do
    path '/todos/{id}/items' do
        post 'Create a new item' do
            tags 'Items'
            parameter name: :id, in: :path,required: true,type: :string 
            parameter name: :Authorization, in: :header, required: true, type: :string
            parameter name: :item, in: :body, required: true, schema: {
                type: :object,
                properties: {
                    name: {type: :string}
                },
                required: ['name']
            }

            response '200','Item was added.' do
                let(:id) {Todo.create(title: 'Tes todo').id} 
                let(:item) {
                    {
                        name: 'Test Item'
                    }
                }
                let(:Authorization) { "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2NDE0ODQ2MzF9.TVbPHn8JeBYSURyk337oTBjMgaVxJ_qfXAySZb9lUEQ"}
                run_test!
            end
        end
    end

    path '/todos/{todoId}/items/{itemId}' do
        put 'Update Item' do
            tags 'Items'
            parameter name: :todoId,in: :path,required: true,type: :string 
            parameter name: :itemId,in: :path,required: true,type: :string 
            parameter name: :item,in: :body, schema: {
                type: :object,
                properties: {
                    name: {type: :string} 
                },
                required: ['name'] 
            }
            parameter name: :Authorization, in: :header, required: true, type: :string

            response '204', 'Item was updated.' do
                let(:todoId) { Todo.create(title: 'Test Todo').id } 
                let(:itemId) {Item.create(title: 'Test Item').id} 
                let(:item) {
                    {
                        name: 'Test2 Item' 
                    }
                }
                let(:Authorization) { "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2NDE0ODQ2MzF9.TVbPHn8JeBYSURyk337oTBjMgaVxJ_qfXAySZb9lUEQ"}
                run_test!
            end
        end

        delete 'Delete Item' do
            tags 'Items'
            parameter name: :todoId,in: :path,required: true,type: :string 
            parameter name: :itemId,in: :path,required: true,type: :string 
            parameter name: :Authorization, in: :header, required: true, type: :string

            response '204', 'Item was Deleted.' do
                let(:todoId) { Todo.create(title: 'Test Todo').id } 
                let(:itemId) {Item.create(title: 'Test Item').id} 
                let(:Authorization) { "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2NDE0ODQ2MzF9.TVbPHn8JeBYSURyk337oTBjMgaVxJ_qfXAySZb9lUEQ"}
                run_test!
            end
        end
    end
end