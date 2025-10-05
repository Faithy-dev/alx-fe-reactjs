// src/components/RecipeDetail.jsx
import React from "react";
import { useParams } from "react-router-dom";

function RecipeDetail() {
  const { id } = useParams(); // gets the recipe id from the URL

  return (
    <div>
      <h1>Recipe Detail</h1>
      <p>Showing details for recipe ID: {id}</p>
    </div>
  );
}

export default RecipeDetail;
