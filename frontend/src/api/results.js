/**
 * Fetch all results from the backend API.
 */
export async function fetchAllResults() {
  const response = await fetch('/api/results');
  
  if (!response.ok) {
    const errorData = await response.json().catch(() => ({}));
    throw new Error(errorData.detail || 'Failed to fetch results from backend.');
  }
  
  return await response.json();
}