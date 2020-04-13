package com.hunau.web.controller.websocket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    private  Logger log = LogManager.getLogger(WebSocketConfig.class);

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry){

        String mapping = "operation/wb/test";
        registry.addHandler(webSocketHandler(),mapping);
        log.info("WebSocket已注册，WB地址：" + mapping);

    }

    @Bean
    public WebSocketHandler webSocketHandler(){
        return new WbHandler();
    }
}
