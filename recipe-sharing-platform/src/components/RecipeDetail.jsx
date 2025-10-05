// src/components/RecipeDetail.jsx
import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import data from "../data.json"; // adjust path if needed

function RecipeDetail() {
  const { id } = useParams(); // recipe ID from URL
  const [recipe, setRecipe] = useState(null);

  useEffect(() => {
    const foundRecipe = data.recipes.find((r) => r.id === id);
    setRecipe(foundRecipe);
  }, [id]);

  if (!recipe) {
    return <p className="text-gray-500 text-lg font-medium">Loading recipe...</p>;
  }

  return (
    <div className="max-w-3xl mx-auto p-6 shadow-lg bg-white rounded-lg mt-8">
      <h1 className="text-3xl font-bold mb-4 text-gray-800">{recipe.name}</h1>
      <img
        src={recipe.image}
        alt={recipe.name}
        className="w-full h-auto rounded-md shadow-md mb-6"
      />
      
      <h2 className="text-2xl font-semibold mb-2 text-gray-700">Ingredients</h2>
      <ul className="list-disc list-inside mb-6">
        {recipe.ingredients.map((ingredient, index) => (
          <li key={index} className="text-gray-600 font-medium">
            {ingredient}
          </li>
        ))}
      </ul>

      <h2 className="text-2xl font-semibold mb-2 text-gray-700">Instructions</h2>
      <p className="text-gray-600 font-normal">{recipe.instructions}</p>
    </div>
  );
}

export default RecipeDetail;
