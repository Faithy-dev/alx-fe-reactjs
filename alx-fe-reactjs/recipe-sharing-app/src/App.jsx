import RecipeList from './components/RecipeList';
import AddRecipeForm from './components/AddRecipeForm';

function App() {
  return (
    <div
      style={{
        fontFamily: 'Arial, sans-serif',
        maxWidth: '600px',
        margin: '0 auto',
        padding: '20px',
        textAlign: 'center',
      }}
    >
      <h1 style={{ color: '#333' }}>🍲 Recipe Sharing App</h1>

      {/* Add Recipe Form */}
      <AddRecipeForm />

      {/* Recipe List */}
      <RecipeList />
    </div>
  );
}

export default App;
