window.addEventListener('load', () => {
  const previewInput = document.getElementById("memo-code");
  previewInput.addEventListener("input", () => {
    const previewValue = previewInput.value;
    const memoMarkDown = document.getElementById("preview");
    memoMarkDown.innerHTML = (previewValue)
 })
});