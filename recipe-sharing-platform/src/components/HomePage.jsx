import { useState } from "react";
import { useEffect } from "react";
import recipesData from "../data.json";
function HomePage() {

  const [recipes, setRecipes] = useState([]);

  useEffect(() => {
    setRecipes(recipesData);
  }, []);

  return ( 
 <div className="min-h-screen bg-gray-100">
      <h1 className="text-4xl font-bold text-center py-8 text-gray-800">🍽️ Recipe Gallery</h1>

      <div className="px-6 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
        {recipes.map((recipe) => (
          <div
            key={recipe.id}
            className="bg-white rounded-xl shadow-md overflow-hidden transform transition duration-300 hover:shadow-xl hover:scale-105"
          >
            <img
              src={recipe.image}
              alt={recipe.title}
              className="w-full h-48 object-cover"
            />
            <div className="p-5">
              <h2 className="text-2xl font-semibold text-gray-800 mb-2">{recipe.title}</h2>
              <p className="text-gray-600">{recipe.summary}</p>
            </div>
          </div>
        ))}
      </div>
    </div>


   );
}

export default HomePage;
