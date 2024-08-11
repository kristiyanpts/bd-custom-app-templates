import React, { ReactNode, useEffect, useRef, useState } from "react";
import { isEnvBrowser } from "../utils/misc";
import "./App.css";
import { fetchNui } from "../utils/fetchNui";
import { useNuiEvent } from "../hooks/useNuiEvent";

interface NuiEventData {
  message: string;
}

const App: React.FC = () => {
  useEffect(() => {
    document.getElementsByTagName("html")[0].style.visibility = "visible";
    document.getElementsByTagName("body")[0].style.visibility = "visible";
  }, []);

  useNuiEvent("TestMessage", (data:NuiEventData) => {
    console.log(JSON.stringify(data.message));
  });

  useEffect(() => { 
    fetchNui("TestFetch")
  });
  return (
    <AppProvider>
      <div className="app">
          <div className="app-wrapper"></div>
      </div>
    </AppProvider>
  );
};

const AppProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
  if (isEnvBrowser()) {
    return <div className="browser-wrapper">{children}</div>;
  } else return children;
};

export default App;