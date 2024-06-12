import React, { useEffect, useMemo } from "react";
import {
  Route,
  Routes,
  useLocation,
  Navigate,
  useNavigate,
} from "react-router-dom";
import Sidebar from "./components/Sidebar";
import Dashboard from "./page/students";
import { Box, Center, Flex, Loader } from "@mantine/core";
import { useLoader, useUser } from "./redux/selectors";
import Lessons from "./page/lessons";
import Login from "./page/admin/login";
import About from "./page/about";

const routes = [
  {
    path: "/",
    element: <Dashboard />,
  },
  {
    path: "/login",
    element: <Login />,
  },
  {
    path: "/lessons",
    element: <Lessons />,
  },
  {
    path: "/about",
    element: <About />,
  },
  {
    path: "*",
    element: <Navigate to="/login" />,
  },
];

export default function App() {
  const navigate = useNavigate();
  const { pathname } = useLocation();
  const user = useUser();
  const loading = useLoader();

  const isHideSideBar = useMemo(
    () => ["/login"].includes(pathname),
    [pathname]
  );

  useEffect(() => {
    if (!user?.token) {
      navigate("/login");
    }
  }, [user?.token, navigate]);

  return (
    <Flex maw={"100vw"} gap={20} gutter={0}>
      <Box miw={200} display={isHideSideBar ? "none" : "block"}>
        <Sidebar />
      </Box>

      <Box
        w={`calc(100dvw - ${isHideSideBar ? "0px" : "200px"})`}
        mih={isHideSideBar ? "100dvh" : "none"}
        pos={"relative"}
        style={{
          overflowY: loading ? "hidden" : "auto",
          maxHeight: `calc(100dvh - ${loading ? 100 : 0}px)`,
          transition: "300ms ease",
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
        }}
      >
        <Center
          p={loading ? "lg" : 0}
          h={!loading && 0}
          style={{
            overflow: "hidden",
            transition: "300ms ease",
          }}
        >
          <Loader />
        </Center>
        <Routes>
          {routes.map((route) => (
            <Route key={route.path} {...route} />
          ))}
        </Routes>
      </Box>
    </Flex>
  );
}
