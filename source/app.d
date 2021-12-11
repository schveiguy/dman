import raylib;
import std.random;

struct Dman
{
    Vector2 pos = Vector2(0, 0);
    Vector2 velocity = Vector2(15, 15);


    void draw()
    {
        rlPushMatrix();
        scope(exit) rlPopMatrix();
        rlTranslatef(pos.x, pos.y, 0);
        // the D shape
        DrawRectangle(0, 0, 30, 200, Colors.RED);
        DrawRing(Vector2(30, 100), 70, 100, 0, 180, 60, Colors.RED);

        // eyes, rotated a bit 
        {
            rlPushMatrix();
            scope(exit) rlPopMatrix();
            rlRotatef(10, 0, 0, 1);
            DrawEllipse(50, 30, 15, 20, Colors.WHITE);
            DrawEllipseLines(50, 30, 15, 20, Colors.BLACK);
            DrawEllipse(58, 33, 7, 10, Colors.BLACK);
            DrawEllipse(80, 30, 15, 20, Colors.WHITE);
            DrawEllipseLines(80, 30, 15, 20, Colors.BLACK);
            DrawEllipse(88, 33, 7, 10, Colors.BLACK);
        }

        // arms
        DrawLineEx(Vector2(3, 63), Vector2(-43, -3), 3, Colors.BLACK);
        DrawLineEx(Vector2(-43, -3), Vector2(11, -62), 3, Colors.BLACK);
        DrawLineEx(Vector2(113, 54), Vector2(155, 2), 3, Colors.BLACK);
        DrawLineEx(Vector2(155, 2), Vector2(43, -62), 3, Colors.BLACK);

        // hands
        DrawEllipse(44, -66, 13, 18, Colors.WHITE);
        DrawEllipseLines(44, -66, 13, 18, Colors.BLACK);
        DrawEllipse(24, -69, 13, 18, Colors.WHITE);
        DrawEllipseLines(24, -69, 13, 18, Colors.BLACK);

        // legs
        DrawLineEx(Vector2(68, 190), Vector2(94, 229), 3, Colors.BLACK);
        DrawLineEx(Vector2(94, 229), Vector2(71, 261), 3, Colors.BLACK);
        DrawLineEx(Vector2(27, 199), Vector2(18, 225), 3, Colors.BLACK);
        DrawLineEx(Vector2(18, 225), Vector2(27, 260), 3, Colors.BLACK);

        // feet
        DrawEllipse(10, 265, 20, 14, Colors.WHITE);
        DrawEllipseLines(10, 265, 20, 14, Colors.BLACK);
        DrawEllipse(90, 265, 20, 14, Colors.WHITE);
        DrawEllipseLines(90, 265, 20, 14, Colors.BLACK);
    }
}

void main()
{
    InitWindow(600, 600, "D");
    scope(exit) CloseWindow();
    Dman dman;
    SetTargetFPS(40);
    while(!WindowShouldClose())
    {
        // move the dman around, bounce off the walls at random velocities
        dman.pos = dman.pos + dman.velocity;
        if(dman.pos.x >= 600)
            dman.velocity.x = uniform(-30, -5);
        else if(dman.pos.x <= 0)
            dman.velocity.x = uniform(5, 30);
        if(dman.pos.y >= 600)
            dman.velocity.y = uniform(-30, -5);
        else if(dman.pos.y <= 0)
            dman.velocity.y = uniform(5, 30);
        BeginDrawing();
        ClearBackground(Colors.DARKGRAY);
        dman.draw();
        EndDrawing();
    }
}
