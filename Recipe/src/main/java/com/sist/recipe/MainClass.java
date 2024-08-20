package com.sist.recipe;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MainClass {

    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "hr";
    private static final String DB_PASSWORD = "happy";

    public static void main(String[] args) {
        try {
            for (int i = 1; i <= 2000; i++) {
                Document doc = Jsoup.connect("https://ottogi.okitchen.co.kr/category/detail?page=1&searchCateFirst=1&searchCateSecond=2&sort=&idx=" + i).get();//https://ottogi.okitchen.co.kr/category/detail?idx=;

                // container detailTop에 있는 이미지와 이름 가져오기
                String poster = null;
                Element detailTop = doc.selectFirst(".container.detailTop img");
                if (detailTop != null) {
                    poster = detailTop.attr("src");
                }

                // detailInfo에 있는 H2 태그 가져오기
                StringBuilder title = new StringBuilder();
                Elements detailInfoh2 = doc.select(".detailInfo h2");
                for (Element h2 : detailInfoh2) {
                    title.append(h2.text()).append("\n");
                }

                // detailInfo에 있는 P 태그들 가져오기
              
                
                StringBuilder subtitle = new StringBuilder();
                Element firstDetailInfoP = doc.selectFirst(".detailInfo p");
                if (firstDetailInfoP != null) {
                    subtitle.append(firstDetailInfoP.text()).append("\n");
                }

                // ContentArea에서 <br> 태그 뒤에 오는 <p> 태그들 가져오기
                String[] detail_poster = new String[10];
                String[] detail_content = new String[10];

                // 기본값으로 빈 문자열 설정
                for (int j = 0; j < 10; j++) {
                    detail_poster[j] = "";
                    detail_content[j] = "";
                }

                // 이미지 가져오기
                Elements detail_Poster = doc.select(".ContentArea img");
                for (int j = 0; j < 10 && j < detail_Poster.size(); j++) {
                    detail_poster[j] = detail_Poster.get(j).attr("src");
                }

                // <br> 뒤의 <p> 태그 찾기
                Elements contentElements = doc.select(".ContentArea *"); // 모든 요소를 선택

                int contentIndex = 0; // detail_content 배열 인덱스
                for (int j = 0; j < contentElements.size(); j++) {
                    Node node = contentElements.get(j);
                    if (node instanceof Element) {
                        Element element = (Element) node;
                        if (element.tagName().equals("br")) {
                            // <br> 태그 뒤의 <p> 태그를 확인
                            if (j + 1 < contentElements.size() && contentElements.get(j + 1) instanceof Element) {
                                Element nextElement = (Element) contentElements.get(j + 1);
                                if (nextElement.tagName().equals("p")) {
                                    String text = nextElement.text().trim();
                                    if (!text.isEmpty() && contentIndex < 10) {
                                        detail_content[contentIndex++] = text;
                                    }
                                }
                            }
                        }
                    }
                }

                // stats01에 있는 LI 태그들 가져오기
                String info1 = "", info2 = "", info3 = "";
                Elements statsLis1 = doc.select(".stats01 li");
                if (statsLis1.size() >= 3) {
                    info1 = statsLis1.get(0).selectFirst("h4").text();
                    info2 = statsLis1.get(1).selectFirst("h4").text();
                    info3 = statsLis1.get(2).selectFirst("h4").text();
                }

                // ingredients에 있는 P 태그들 가져오기
                StringBuilder ingredients = new StringBuilder();
                Elements ingredientPs = doc.select(".ingredients p");
                for (Element p : ingredientPs) {
                    ingredients.append(p.text()).append("\n");
                }

                // 데이터베이스에 연결합니다.
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String sql = "INSERT INTO recipe(reno, poster, title, subtitle, detail_poster1, detail_content1, detail_poster2, detail_content2, detail_poster3, detail_content3, detail_poster4, detail_content4, detail_poster5, detail_content5, detail_poster6, detail_content6, detail_poster7, detail_content7, detail_poster8, detail_content8, detail_poster9, detail_content9, detail_poster10, detail_content10, info1, info2, info3, ingredients) "
                            + "VALUES(re_reno_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                    try (PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setString(1, poster);
                        ps.setString(2, title.toString());
                        ps.setString(3, subtitle.toString());
                        for (int j = 0; j < 10; j++) {
                            ps.setString(4 + (j * 2), detail_poster[j]); // detail_poster1 to detail_poster10
                            ps.setString(5 + (j * 2), detail_content[j]); // detail_content1 to detail_content10
                        }
                        ps.setString(24, info1);
                        ps.setString(25, info2);
                        ps.setString(26, info3);
                        ps.setString(27, ingredients.toString());

                        ps.executeUpdate();
                        System.out.println("Data inserted successfully for page " + i + "!");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
