function my_video = my_video_writer(imagefolder_datastore,frame_rate,filename)
    my_video = VideoWriter(filename);
    my_video.FrameRate = frame_rate;
    my_video.open()
    
    for i = 1:1:length(imagefolder_datastore.Files)
        frame = readimage(imagefolder_datastore,i);
        writeVideo(my_video, frame);
    end
    
    my_video.close()
    
    pause(5)
end
