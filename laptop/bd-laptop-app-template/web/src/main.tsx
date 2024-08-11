import { isEnvBrowser } from "./utils/misc";
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './components/App';
import './index.css';
import "./colors.css";

const rootElement = document.getElementById("root");
if (rootElement) {
  const root = ReactDOM.createRoot(rootElement);
  if (window.name === "" || isEnvBrowser()) {
    root.render(
      <React.StrictMode>
        <App />
      </React.StrictMode>
    );
  }
} else {
  console.error("Root element with id 'root' not found.");
}