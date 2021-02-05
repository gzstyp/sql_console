SELECT
            SUM(sampling_total) sampling_total,
            SUM(detection_total) detection_total,
            SUM(masculine_total) positive,
            ROUND(SUM(detection_total)/SUM(sampling_total)*100,2)pc
        from bs_crowd_total b where flag = 1