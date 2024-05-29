import React, { ReactNode, useEffect, useRef, useState } from "react";
import { isEnvBrowser } from "./utils/misc";
import { fetchNui } from "./utils/fetchNui";
import "./App.css";

const resourceName = "react-ts-app-template";

const App = () => {
  const [nuiData, setNuiData] = useState("");

  useEffect(() => {
    document.getElementsByTagName("html")[0].style.visibility = "visible";
    document.getElementsByTagName("body")[0].style.visibility = "visible";

    fetchNui("getClientData", resourceName, resourceName)
      .then((data: string) => setNuiData(data))
      .catch((e) => {
        console.error("Setting mock data due to error", e);
        setNuiData("Mock Data");
      });
  }, []);

  return (
    <AppProvider>
      <div className="app">
        <div className="app-wrapper">
          <div className="header">
            <div className="title">Bulgar Development's App Template</div>
            <div className="subtitle">React TS</div>
            <div className="subtitle">{nuiData}</div>
          </div>
        </div>
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
