document.addEventListener("turbo:load", () => {
  const tabs = document.querySelectorAll(".task-index-tab");

  tabs.forEach(tab => {
    tab.addEventListener("click", () => {

      tabs.forEach(t => t.classList.remove("active"));
      tab.classList.add("active");

      const type = tab.dataset.tab;

      document.querySelectorAll(".task-index-item").forEach(task => {
        const status = task.dataset.status;

        if (type === "all") {
          task.style.display = "block";
        } else {
          task.style.display = status === type ? "block" : "none";
        }
      });
    });
  });
});