// src/components/RecipeDetail.jsx
import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import data from "../data.json"; // make sure this path is correct

function RecipeDetail() {
  const { id } = useParams(); // recipe ID from URL
  const [recipe, setRecipe] = useState(null);

  useEffect(() => {
    // Find recipe by ID in the data.json
    const foundRecipe = data.recipes.find((r) => r.id === id);
    setRecipe(foundRecipe);
  }, [id]);

  if (!recipe) {
    return <p>Loading recipe...</p>;
  }

  return (
    <div>
      <h1>{recipe.name}</h1>
      <img src={recipe.image} alt={recipe.name} style={{ width: "300px" }} />
      <h2>Ingredients</h2>
      <ul>
        {recipe.ingredients.map((ingredient, index) => (
          <li key={index}>{ingredient}</li>
        ))}
      </ul>
      <h2>Instructions</h2>
      <p>{recipe.instructions}</p>
    </div>
  );
}

export default RecipeDetail;
